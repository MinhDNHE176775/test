/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function convertDateFormat(dateStr){
    const date = new Date(dateStr);
    
    const year = date.getFullYear();
    const month = (date.getMonth() + 1).toString().padStart(2, '0'); // getMonth() returns 0-11
    const day = date.getDate().toString().padStart(2, '0');
    return `${year}-${month}-${day}`;
}

function convertTo24Hour(time) {
    const [timePart, modifier] = time.split(' '); 
    let [hours, minutes, seconds] = timePart.split(':'); 

    if (hours === '12') {
        hours = '00'; 
    }

    if (modifier === 'PM') {
        hours = (parseInt(hours, 10) + 12).toString(); // Convert PM hours to 24-hour format
    }

    return `${hours.padStart(2, '0')}:${minutes}:${seconds}`; // Return the time in 24-hour format
}

