package
{
    import com.johnlindquist.multiplayer.MultiplayerGameContext;

    import flash.display.Sprite;

    /**
     * @author John Lindquist
     */
    [SWF(backgroundColor="#000000", width="640", height="480", frameRate="3")]
    public class ElectroServerTestRun extends Sprite
    {
        private var multiplayerGameContext:MultiplayerGameContext;

        public function ElectroServerTestRun()
        {
            multiplayerGameContext = new MultiplayerGameContext(this);
        }
    }
}
