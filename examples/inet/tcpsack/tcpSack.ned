//
// author: Thomas Reschka
//

package inet.examples.inet.tcpsack;

import inet.networklayer.autorouting.ipv4.IPv4NetworkConfigurator;
import inet.nodes.inet.Router;
import inet.nodes.inet.StandardHost;
import ned.DatarateChannel;


network tcpsack
{
    parameters:
        @display("bgb=400,200");
    submodules:
        router: Router {
            parameters:
                @display("p=200,100;i=abstract/router");
            gates:
                pppg[2];
        }
        client: StandardHost {
            parameters:
                @display("p=50,100");
            gates:
                pppg[1];
        }
        server: StandardHost {
            parameters:
                @display("p=350,100;i=device/server");
            gates:
                pppg[1];
        }
        networkConfigurator: IPv4NetworkConfigurator {
        }
    connections:
        router.pppg[0] <--> NormalPath <--> client.pppg[0];
        router.pppg[1] <--> NormalPath <--> server.pppg[0];
}

channel NormalPath extends DatarateChannel
{
    parameters:
        datarate = 100Mbps;
        delay = 0.0565us; // 10m
        per = 0;
        ber = 0;
}
