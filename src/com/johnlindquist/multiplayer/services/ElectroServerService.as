package com.johnlindquist.multiplayer.services
{
	import flight.net.IResponse;
	import flight.net.Response;

	import com.electrotank.electroserver4.ElectroServer;
	import com.electrotank.electroserver4.entities.Protocol;
	import com.electrotank.electroserver4.message.Message;
	import com.electrotank.electroserver4.message.MessageType;
	import com.electrotank.electroserver4.message.event.ConnectionEvent;
	import com.electrotank.electroserver4.message.event.JoinRoomEvent;
	import com.electrotank.electroserver4.message.event.UserListUpdateEvent;
	import com.electrotank.electroserver4.message.event.UserVariableUpdateEvent;
	import com.electrotank.electroserver4.message.request.CreateRoomRequest;
	import com.electrotank.electroserver4.message.request.LoginRequest;
	import com.electrotank.electroserver4.message.response.GetUserVariablesResponse;
	import com.electrotank.electroserver4.message.response.LoginResponse;
	import com.electrotank.electroserver4.room.Room;
	import com.electrotank.electroserver4.user.User;
	import com.johnlindquist.multiplayer.signals.ExisitingUsersFound;
	import com.johnlindquist.multiplayer.signals.HeroServerUpdated;
	import com.johnlindquist.multiplayer.signals.MyUserAdded;
	import com.johnlindquist.multiplayer.signals.UserAdded;

	import org.robotlegs.mvcs.Actor;
	/**
     * @author John Lindquist
     */
    public class ElectroServerService extends Actor
    {
        private static const ROOM_NAME:String = "ROOM_NAME";

        private static const ZONE_NAME:String = "ZONE_NAME";

        private var electroServer:ElectroServer;

        private var room:Room;

        private var connectResponse:Response;

        private var loginResponse:Response;

        private var joinRoomResponse:Response;
        
		private var myUserName:String;
		private var myUserID:String;
		private var myUser:User;

        [Inject]
		public var userAdded:UserAdded;
		
		[Inject]
		public var myUserAdded:MyUserAdded;
		
		[Inject]
		public var heroServerUpdate:HeroServerUpdated;
		
		[Inject]
		public var existingUsersFound:ExisitingUsersFound;

		public function ElectroServerService()
        {
            connectResponse = new Response();
            loginResponse = new Response();
            joinRoomResponse = new Response();
        }

        public function connect():IResponse
        {
            electroServer = new ElectroServer();
            electroServer.setProtocol(Protocol.TEXT);
            electroServer.addEventListener(MessageType.ConnectionEvent, "onConnectionEvent", this);
            electroServer.addEventListener(MessageType.LoginResponse, "onLoginResponse", this);
            electroServer.addEventListener(MessageType.JoinRoomEvent, "onJoinRoomEvent", this);
            electroServer.addEventListener(MessageType.UserListUpdateEvent, "onUserListUpdate", this);
            electroServer.addEventListener(MessageType.UserVariableUpdateEvent, "onUserVariableUpdate", this);
            electroServer.addEventListener(MessageType.GetUserVariablesResponse, "onGetUserVariablesResponse", this);
            electroServer.createConnection("127.0.0.1", 9898);

            return connectResponse;
        }

        public function login(userName:String, password:String = "password"):IResponse
        {
            var loginRequest:LoginRequest = new LoginRequest();
            loginRequest.setUserName(userName);
            loginRequest.setPassword(password);
            electroServer.send(loginRequest);

            return loginResponse;
        }

        public function joinRoom():IResponse
        {
            var createRoomRequest:CreateRoomRequest = new CreateRoomRequest();
            createRoomRequest.setRoomName(ROOM_NAME);
            createRoomRequest.setZoneName(ZONE_NAME);
            electroServer.send(createRoomRequest);

            return joinRoomResponse;
        }


        public function onConnectionEvent(event:ConnectionEvent):void
        {
            if (event.getAccepted())
            {
                connectResponse.complete(electroServer);
            }
            else
            {
                connectResponse.cancel(new Error("Failed to connect"));
            }
        }

        public function onLoginResponse(event:LoginResponse):void
        {
        	myUserName = event.getUserName();
        	myUserID = event.getUserId();
        	
            if (event.getAccepted())
            {
                loginResponse.complete(electroServer);
            }
            else
            {
                loginResponse.cancel(new Error("Failed to login with " + event.getUserName()));
            }
        }

        public function onJoinRoomEvent(event:JoinRoomEvent):void
        {
			joinRoomResponse.complete(electroServer);
            room = event.room;
            
            myUser = room.getUserById(myUserID);
            
            var everyoneButMe:Array = [];
            for each(var user:User in room.getUsers())
            {
            	if(user != myUser)
            	{
					everyoneButMe.push(user);
				}
            }
            
            existingUsersFound.dispatch(everyoneButMe);
            
            myUserAdded.dispatch(myUser);
		}

		public function onUserListUpdate(event:UserListUpdateEvent):void 
		{
			if(event.getActionId() == UserListUpdateEvent.AddUser)
			{
				userAdded.dispatch(event.getUser());
			}
		}

		public function onUserVariableUpdate(event:UserVariableUpdateEvent):void 
		{
			heroServerUpdate.dispatch(event);
		}

		public function onGetUserVariablesResponse(event:GetUserVariablesResponse):void 
		{
			
		}

		
		public function send(message:Message):void 
		{
			electroServer.send(message);	
		}
	}
}
