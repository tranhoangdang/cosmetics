var preview = function(event){
  var frame = document.getElementById('frame');
  frame.src = URL.createObjectURL(event.target.files[0]);
  frame.onload = function(){
      URL.revokeObjectURL(frame.src);
  }
};
  
function myFunction() {
  var x = document.getElementById("category").value;
  document.getElementById("skin").style.display = x == 1 ? "block" : 'none';
}