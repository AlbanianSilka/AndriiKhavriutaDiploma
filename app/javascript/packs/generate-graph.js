import Chart from "chart.js/auto";

function createChart(btn) {
    if(btn.parentElement.querySelector("canvas") == null) {
        const valuesStr = btn.dataset.values;
        let values = JSON.parse(valuesStr);

        const canvas = document.createElement("canvas");
        canvas.id = "chart";
        canvas.width = 200;
        canvas.height = 200;

        const container = btn.parentNode;
        container.appendChild(canvas);

        const buttonRect = btn.getBoundingClientRect();
        const containerRect = container.getBoundingClientRect();
        canvas.style.left = buttonRect.left - containerRect.left + "px";
        canvas.style.top = buttonRect.bottom - containerRect.top + "px";

        if (typeof (values) === "string") {
            values = JSON.parse(values)
        }

        const chart = new Chart(canvas, {
            type: "line",
            data: {
                labels: Array.from({ length: values.length }, (v, i) => i),
                datasets: [
                    {
                        label: "Температура",
                        data: values,
                        borderColor: "rgb(18,175,45)"
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                aspectRatio: 0.3,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }
    else {
        const canvas = btn.parentElement.querySelector("canvas");
        canvas.remove();
    }
}

let buttons = document.querySelectorAll(".graph-button");
buttons.forEach(btn => {
    btn.addEventListener("click", event => {
        event.stopPropagation();
        createChart(btn);
    });
});

document.addEventListener("click", event => {
    if (event.target.matches(".graph-button")) {
        createChart(event.target);
    }
});
