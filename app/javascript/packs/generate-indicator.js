import Chart from "chart.js/auto";
import $ from 'jquery';

document.addEventListener("click", function(event) {
    const currentUrl = window.location.href;
    if (currentUrl.includes("/mechanisms/")) {
        if (event.target.tagName !== "INPUT" && event.target.tagName !== "BUTTON") {
            $.ajax({
                url: "/indicators",
                type: "POST",
                data: {
                    indicator: {
                        mechanism_id: 1,
                        x_value: event.pageX,
                        y_value: event.pageY
                    }
                },
                dataType: "json",
                success: function(response) {
                    console.log("Success:", response);
                    const container = document.getElementById("container_ind");
                    const indicatorBox = document.createElement("div");
                    const yValue = document.createElement("div");
                    const yValueText = document.createTextNode(event.pageY);

                    indicatorBox.className = "indicator_box";
                    indicatorBox.style.position = "absolute";
                    indicatorBox.style.left = event.pageX + "px";
                    indicatorBox.style.top = event.pageY + "px";

                    yValue.className = "y-value";
                    yValue.style.position = "absolute";
                    yValue.style.left = "0";
                    yValue.style.top = "0";
                    yValue.appendChild(yValueText);

                    indicatorBox.appendChild(yValue);
                    container.appendChild(indicatorBox);
                },
                error: function(response) {
                    console.log("Error:", response);
                }
            });
        }
    }
});
