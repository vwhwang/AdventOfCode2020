const fs = require('fs');

var input = '';
fs.readFile('day2_input.txt', 'utf8', (err, data) => {
  if (err) throw err;
  var input = data.split("\n");
  var input_info = []

  for (let i = 0; i < input.length; i++) {
    var temp = input[i].split(" ");
    input_info.push(temp);
    input_info[i].push((input_info[i][2].match(new RegExp(input_info[i][1][0], "g")) || []).length)
    input_info[i].push(input_info[i][0].split("-"));
    var check_number = 0 
    var check1 = input_info[i][2][parseInt(input_info[i][4][0]) - 1 ];
    var check2 = input_info[i][2][parseInt(input_info[i][4][1]) - 1 ];
    input_info[i].push(check1 != check2 &&(check1 == input_info[i][1][0] || check2 == input_info[i][1][0] ));
    input_info[i].push(check1 + check2 );

  };

  var count = 0 

  for (let i = 0; i < input_info.length; i++) {
    if (input_info[i][3] >= parseInt(input_info[i][4][0]) && input_info[i][3] <= parseInt(input_info[i][4][1])){
      count++;} 
  }
  
  //PART II 
  var count2 = 0 
  for (let i = 0; i < input_info.length; i++) {
    if (input_info[i][5]){
      count2++;} 
  }
  console.log(count);
  console.log(count2);
});


