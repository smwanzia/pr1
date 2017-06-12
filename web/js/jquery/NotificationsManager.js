/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    $(".hmenu li:first").prepend(" <span class='badge red' id='all_notifications'>0</span>");
    countNotifications();
    window.setInterval(countNotifications, 10000);
    function countNotifications() {
        $.ajax({
            type: "post",
            url: "LoadSystemNotifications",
            dataType: "json",
            beforeSend: function () {
                $(".badge").hide("fast");
            },
            success: function (msg) {
                var all = msg.all.allSystemNotifications.number;
                if(all===0){
                    $(".badge").hide();
                }else{
                    $("#system_notifications").show("slow");
                    $("#system_notifications").text(all);
                }
                var reminders = msg.reminders.reminderNotification.number;
                if(reminders===0){
                    $("#reminder_notifications").hide();
                }else{
                    $("#reminder_notifications").show("slow");
                    $("#reminder_notifications").text(reminders);
                }
                var approvals = msg.approvals.approvalNotifications.number;

                if (approvals === 0) {
                    $("#approval_notifications").hide();
                } else {
                    $("#approval_notifications").show("slow");
                    $("#approval_notifications").text(approvals);
                }
                var incomingSMS = msg.incomingSMS.incomingSMSNotifications.number;
                if (incomingSMS === 0) {
                    $("#incoming_sms_notifications").hide();
                } else {
                    $("#incoming_sms_notifications").show("slow");
                    $("#incoming_sms_notifications").text(incomingSMS);
                }
            },
            complete: function (jqXHR, textStatus) {
                if (textStatus !== "success") {
                    $(".badge .red").hide();
                } else {
                    $(".badge .red").show();
                }
            }

        });
    }
});



