import $ from 'jquery';

$(document).ready(function () {
  
$(function () {
  var sec = 0;
  var min = 0;
  var hour = 0;
  var countsec = 0;
  var timer;
  var sec_number;
  var min_number;
  var hour_number;
  var counter;
  var current_task_time = gon.current_task_time;
  var entire_task_time

  // スタート
  $('#start').click(function() {
    // 00:00:00から開始
    
    
    $('#countsec').html('0');
    timer = setInterval(countup, 1000);

    $(this).prop('disabled', true);
    $('#stop,#reset').prop('disabled', false);
  });

  // ストップ
  $('#stop').click(function() {
    // 一時停止
    clearInterval(timer);

    $(this).prop('disabled', true);
    $('#restart,#start').prop('disabled', false);

    counter = $('#countsec').val()

    $.ajax({
    url: " /",
    type: "GET",
    data: {counter : countsec},
    datatype: "html"
    })
    .done(function(data){
      $("#task_elapsed_time").val(entire_task_time);
    })
    .fail(function(){
      alert("時間の計測に失敗しました。");
    })
    
  });


  // リスタート
  // $('#restart').click(function() {
  //   // 一時停止から再開
  //   timer = setInterval(countup, 1000);

  //   $(this).prop('disabled', true);
  //   $('#stop').prop('disabled', false);
  // });

  // リセット
  $('#reset').click(function() {
    // 初期状態
    sec = 0;
    min = 0;
    hour = 0;
    countsec = 0;
    $('#clock').html('00:00:00');
    $('#countsec').html('0');
    clearInterval(timer);

    $('#stop,#restart,#reset').prop('disabled', true);
    $('#start').prop('disabled', false);
  });

 /**
  * カウントアップ
  */
  function countup()
  {
    sec += 1;

    countsec += 1;

    if (sec > 59) {
      sec = 0;
      min += 1;
    }

    if (min > 59) {
      min = 0;
      hour += 1;
    }

    // 0埋め
    sec_number = ('0' + sec).slice(-2);
    min_number = ('0' + min).slice(-2);
    hour_number = ('0' + hour).slice(-2);

    $('#clock').html(hour_number + ':' +  min_number + ':' + sec_number);
    $('#countsec').html(countsec);
    entire_task_time = current_task_time + countsec
    $('#entire_task_time').html(entire_task_time);
  }



});

});