//$(document).ready(function(){
 //  setTimeout(function(){
 //      $('table').hide('slow');
 //  }, 5000);
//});

$(document).ready(function() {
    setInterval(function() {
        $.ajax("/players.json").done(function(players){
            for(var player of players){
                var row = $('[data-player-id=" '+ player.id + '"]');
                if(row.length > 0){
                    row.find('[]').text(player.name);
                }
                console.log(row);
            }
        });
    }, 5000);
})