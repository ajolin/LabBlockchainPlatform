const BusinessNetworkConnection = require('composer-client').BusinessNetworkConnection;

async function createResources() {
    try {
        // Connect to the Business Network
        let bizNetConnection = new BusinessNetworkConnection();
        let bizNetDef = await bizNetConnection.connect("admin@marbles-network");


        // Retrieve the description of the Business Network
        let factory = bizNetDef.getFactory();


        // Create a resource of type Player
        let player1 = factory.newResource('org.hyperledger_composer.marbles', 'Player', 'email:olivier2@mele');
        player1.lastName = 'Truc';
        player1.firstName = 'Olivier2';


        //retrieve the participant registry and add the Player resources
        let playerRegistry = await bizNetConnection.getParticipantRegistry('org.hyperledger_composer.marbles.Player');
        await playerRegistry.addAll([player1, player2, player3]);

        /*let marble = factory.newResource('org.hyperledger_composer.marbles', 'Marble', 'marbleId:1');
        marble.size = 'MEDIUM';
        marble.color = 'ORANGE';
        marble.owner = factory.newRelationship('org.hyperledger_composer.marbles', 'Player', 'email:olivier1@mele');
        */
        
        /*let marbleRegistry = await bizNetConnection.getAssetRegistry('org.hyperledger_composer.marbles.Marble');
        await marbleRegistry.add(marble);
        await marbleRegistry.add(marble1);
        await marbleRegistry.add(marble2);
        */
        
        /*marbleRegistry.getAll()
        let marbles = await marbleRegistry.getAll();
        let tMarbles = new Array({
            head: ['MarbeId', 'Owner', 'Size', 'Color']
        });
        let arrayLength = tMarbles.length;
        marbles.forEach((marble) => {
            let tableLine = [];
            tableLine.push(marble.marbleId);
            tableLine.push(marble.owner);
            tableLine.push(marble.size);
            tableLine.push(marble.color);
            tMarbles.push(tableLine);
        })
        
        bizNetConnection.disconnect();

        // Put to stdout - as this is really a command line app
        return tMarbles;
        */
        
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
}
createResources().then((t) => {
    console.log(t);
});