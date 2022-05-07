var modal1 = document.getElementById('id01');

var mbutton1 = document.getElementsByClassName('modalbutton')[0];
var mbutton2 = document.getElementsByClassName('modalbutton')[1];

var span = document.getElementsByClassName('close')[0];

mbutton1.onclick = function(){
    modal1.style.display = 'block';
}

mbutton2.onclick = function(){
    modal1.style.display = 'block';
}

span.onclick = function(){
    modal1.style.display = 'none';
}

window.onclick = function(event) {
    if (event.target == modal1) {
        modal1.style.display = 'none';
    }
}