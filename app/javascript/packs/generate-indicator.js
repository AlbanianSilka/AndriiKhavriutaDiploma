import Chart from "chart.js/auto";

document.addEventListener("click", function(event) {
    if (event.target.tagName !== "INPUT" && event.target.tagName !== "BUTTON") {
        var x = event.clientX;
        var y = event.clientY;
        // генерировать 3 случайных числа
        var nums = [];
        for (var i = 0; i < 10; i++) {
            nums.push(Math.floor(Math.random() * 40));
        }
        // создать новый элемент в заданных координатах
        var input = document.createElement("input");
        input.type = "text";
        input.id = "myInput";
        input.name = "myInput";
        input.style.position = "absolute";
        input.style.top = y + "px";
        input.style.left = x + "px";
        // добавить новый элемент на страницу
        document.body.appendChild(input);

        // создать кнопку для построения графика
        var button = document.createElement("button");
        button.innerText = "Show Graph";
        button.style.position = "absolute";
        button.style.top = (y + 30) + "px";
        button.style.left = x + "px";
        button.type = "button"; // добавить атрибут type="button"

        // добавить новый элемент на страницу
        document.body.appendChild(button);
        // установить фокус на новое поле ввода
        input.focus();

        // отображать числа в новом поле ввода с интервалом в 1 секунду
        var index = 0;
        var intervalId = setInterval(function () {
            if (index < nums.length) {
                input.value = nums[index];
                index++;
            } else {
                clearInterval(intervalId);
            }
        }, 1000);

        // построить график по сгенерированным числам при клике на кнопку
        button.addEventListener("click", function() {
            // создать новый элемент canvas для графика
            var canvas = document.createElement("canvas");
            canvas.width = 400;
            canvas.height = 400;
            canvas.style.position = "absolute";
            canvas.style.top = (y + 60) + "px";
            canvas.style.left = x + "px";

            // добавить новый элемент на страницу
            document.body.appendChild(canvas);

            // создать массив данных для графика
            var data = {
                labels: ["1s", "2s", "3s", "4s", "5s", "6s", "7s", "8s"],
                datasets: [{
                    label: "Temperature",
                    backgroundColor: "rgba(153, 102, 255, 0.1)",
                    borderColor: "rgba(153, 102, 255, 0.5)",
                    borderWidth: 1,
                    data: nums
                }]
            };

            // создать новый график
            var chart = new Chart(canvas, {
                type: "line",
                data: data,
                options: {
                    responsive: false,
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    }
                }
            });
        })
    }
})
