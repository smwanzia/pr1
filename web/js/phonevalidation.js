/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function phonenumber(inputtxt)
{
    var phone_number = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
    if (inputtxt.value.match(phone_number))
    {
        return true;
    }
    else
    {
        alert("Not a valid Phone Number");
        return false;
    }
}
     