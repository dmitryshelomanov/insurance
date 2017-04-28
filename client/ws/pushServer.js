const io = require('socket.io').listen(6001);

io.on('connection', (socket) => {

    socket.on('newsServer', (data) => {
        socket.broadcast.emit('newsClient', data);
    });

});