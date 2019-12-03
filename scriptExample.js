var url = 'get_students.php';
var $list = $('#student_list');

$(document).ready(function () {
  $.ajax({
    type: 'POST',
    url: url,
    data: {
      command: 'get_students',
    },
    beforeSend: function () {
      $list.html("<div id='load'>Loading ...</div>");
    },

    success: function (data) {
      console.log(data);
      DISPLAY_STUDENTS(data);
      $('#load').remove();
    },

    fail: function () {
      $list.html('Could not get data ...');
    },

  });
});

function DISPLAY_STUDENTS(JSON_DATA) {
  var COL_NAMES = ['Student ID', 'First Name', 'Last Name', 'Grade', 'Housing', 'Type'];

  var data = jQuery.parseJSON(JSON_DATA);
  var $TABLE_OBJ = $('<table>');
  $TABLE_OBJ.attr('id', 'student_table');
  $list.append($TABLE_OBJ);

  $(output).append($TABLE_OBJ);

  //Print a table header
  var $ROW_OBJ = $('<tr>');
  $TABLE_OBJ.append($ROW_OBJ);

  for (var j = 0; j < COL_NAMES.length; j++) {
    var $TB_HEADER = $('<th>');
    $TB_HEADER.html(COL_NAMES[j]);
    $ROW_OBJ.append($TB_HEADER);
  }

  //Print rows
  for (var i = 0; i < data.length; i++) {
    $ROW_OBJ = $('<tr>');
    $TABLE_OBJ.append($ROW_OBJ);

    //Print columns
    $.each(data[i], function (key, value) {
      $COL_OBJ = $('<td>');
      $COL_OBJ.html(value);
      $ROW_OBJ.append($COL_OBJ);
    });
  }
}

$('#student_form').on('submit', function (e) {
  e.preventDefault();
  var details = $('#student_form').serialize();

  console.log(details);

  var $TABLE_OBJ = $('#student_table');
  var $ROW_OBJ = $('<tr>');
  $TABLE_OBJ.append($ROW_OBJ);

  var username = $('#username').val();
  var password = $('#password').val();
  var fulltime = $('#fulltime').val();
  var grade = parseFloat($('#grade').val());
  var course = $('#course').val();
  var comment = $('#comment').val();

  //Print columns
  $COL_OBJ = $('<td>');
  $COL_OBJ.html(username);
  $ROW_OBJ.append($COL_OBJ);

  $COL_OBJ = $('<td>');
  $COL_OBJ.html(password);
  $ROW_OBJ.append($COL_OBJ);

  $COL_OBJ = $('<td>');
  $COL_OBJ.html(fulltime);
  $ROW_OBJ.append($COL_OBJ);

  $COL_OBJ = $('<td>');
  $COL_OBJ.html(grade);
  $ROW_OBJ.append($COL_OBJ);

  $COL_OBJ = $('<td>');
  $COL_OBJ.html(course);
  $ROW_OBJ.append($COL_OBJ);

  $COL_OBJ = $('<td>');
  $COL_OBJ.html(comment);
  $ROW_OBJ.append($COL_OBJ);

  //Insert the new student into database table
  $.post(url, {
      command: 'insert_student',
      student_data: details,
    },
    function (data, status) {
      console.log('Data: ' + data + '\nStatus: ' + status);

      //$status.html(status + ": " + data);
    });
});
