global.isReady = false;
global.state = "waiting";

if show_question("Host a game?") {
    global.isHost = true;

    port = get_integer("Enter the port: ", "25565");
    global.port = port

    global.name = get_string("Enter your name: ", "Player");

    serverTCP = network_create_server(network_socket_tcp, port, 32);

    global.serverTCP = serverTCP;

    global.iteration = 0;

    global.isReady = true;

    global.state = "inGame";
} else {
    global.isHost = false;
    global.hostIp = get_string("Enter the hosts ip: ", "127.0.0.1");
    global.port = get_integer("Enter the port: ", "696969");
    global.name = get_string("Enter your name: ", "Player");

    clientTCP = network_create_socket(network_socket_tcp);

    network_connect(clientTCP, global.hostIp, global.port);

    // var buff = buffer_create(256, buffer_grow, 1);

    // buffer_seek(buff, buffer_seek_start, 0);
    //buffer_write(buff, buffer_s16, 6);
    // buffer_write(buff, buffer_string, global.name);

    // network_send_packet(clientTCP, buff, buffer_tell(buff))

    // buffer_delete(buff);

    global.clientTCP = clientTCP;

    global.iteration = 0;

    global.isReady = true;

    global.state = "inGame";
}

var socketlist = ds_list_create();
var Clients = ds_map_create();

global.socketlist = socketlist;
global.Clients = Clients;
