'use strict';

let Random = {
    "int" :
        (a,b) =>
            a + Math.floor( Math.random() * ( b - a + 1 ) ),
    "float" : 
        (a,b) =>
            a + ( Math.random() * ( b - a ) ),
    "elem" :
        function(a){
            return a[ this.int( 0, a.length - 1 ) ];
        },
    "order" :
    	function(a){
    		return a
    			.map( e => [ e, this.float( 0, 1 ) ] )
    			.sort( (e1,e2) => e1[1] - e2[1] )
    			.map( ee => ee[0] )
    	},
    crypto : {
        "byte" :
            function(){
                return window.crypto.getRandomValues(new Uint8Array(1))[0]
            },
        "bytes" :
            function(n){
                return [ ... Array(n) ]
                    .fill()
                    .map( this.byte )
            }
    }
};

