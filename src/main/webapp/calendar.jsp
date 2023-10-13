<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리</title>
	<style>
       table {
           border-collapse: collapse;
       }

       table, th, td {
           border: 1px solid black;
       }

       th, td {
           text-align: center;
           padding: 5px;
       }

       th {
           background-color: #ccc;
       }

       td:hover {
           background-color: #f2f2f2;
       }
     </style>
   
</head>
<body>
	<h6 class="m-0 font-weight-bold text-primary">10월 일정</h6>
	<div id="calendar"></div>
</body>
  <script>
    function createCalendar(year, month) {
        const calendar = document.getElementById("calendar");

        const date = new Date(year, month - 1, 1);
        const lastDay = new Date(year, month, 0).getDate();

        const days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
        let table = "<table>";
        table += "<tr>";
        for (let day of days) {
            table += "<th>" + day + "</th>";
        }
        table += "</tr>";
        
        let day = 1;
        for (let i = 0; i < 6; i++) {
            table += "<tr>";
            for (let j = 0; j < 7; j++) {
                if (i === 0 && j < date.getDay()) {
                    table += "<td></td>";
                } else if (day > lastDay) {
                    break;
                } else {
                    table += "<td>" + day + "</td>";
                    day++;
                }
            }
            table += "</tr>";
        }
        
        table += "</table>";
        calendar.innerHTML = table;
    }

    const today = new Date();
    createCalendar(today.getFullYear(), today.getMonth() + 1);
</script>
</html>