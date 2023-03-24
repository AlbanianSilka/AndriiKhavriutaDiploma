import $ from 'jquery';

document.addEventListener("click", function(event) {
    const currentUrl = window.location.href;
    if (currentUrl.includes("/mechanisms/")) {
        if (event.target.tagName !== "INPUT" && event.target.tagName !== "BUTTON") {
            const values = "[" + Array.from({length: 10}, () => Math.floor(Math.random() * 10) + 1).toString()
                + "]";
            const valuesStr = JSON.stringify(values);
            const target = event.target;
            target.setAttribute("data-values", valuesStr);
            $.ajax({
                url: "/indicators",
                type: "POST",
                data: {
                    indicator: {
                        mechanism_id: currentUrl.split("/").pop(),
                        x_value: event.pageX,
                        y_value: event.pageY,
                        values: values
                    }
                },
                dataType: "json",
                success: function(response) {
                    console.log("Success:", response);
                    const container = document.getElementById("container_ind");
                    const indicatorBox = document.createElement("div");
                    const valuesBox = document.createElement("div");
                    const valuesBoxText = document.createTextNode(target.getAttribute("data-values").replace(/^\"(.*)\"$/, '$1'));

                    indicatorBox.className = "indicator_box";
                    indicatorBox.style.position = "absolute";
                    indicatorBox.style.left = event.pageX + "px";
                    indicatorBox.style.top = event.pageY + "px";

                    valuesBox.className = "values-box";
                    valuesBox.style.position = "absolute";
                    valuesBox.style.left = "0";
                    valuesBox.style.top = "0";
                    valuesBox.appendChild(valuesBoxText);

                    indicatorBox.appendChild(valuesBox);
                    container.appendChild(indicatorBox);

                    const graphButton = document.createElement("button");
                    graphButton.className = "graph-button";
                    graphButton.setAttribute("data-values", target.getAttribute("data-values"));
                    graphButton.setAttribute("data-x-value", event.pageX);
                    graphButton.setAttribute("data-y-value", event.pageY);
                    graphButton.innerHTML = "Draw Graph";
                    graphButton.style.position = "absolute";
                    graphButton.style.left = event.pageX + "px";
                    graphButton.style.top = parseInt(event.pageY) + valuesBox.clientHeight + 10 + "px";

                    container.appendChild(graphButton);
                },
                error: function(response) {
                    console.log("Error:", response);
                }
            });
        }
    }
});
