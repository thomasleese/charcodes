(function() {

    var outputList = document.querySelector("main ul");
    var outputString = document.querySelector("main p");

    var getUnicode = function(c) {
        var s = c.charCodeAt(0).toString(16);
        if (s.length == 1) {
            return "\\u000" + s;
        } else if (s.length == 2) {
            return "\\u00" + s;
        } else if (s.length == 3) {
            return "\\u0" + s;
        } else {
            return "\\u" + s;
        }
    };

    var updateCharacters = function(s) {
        // clear outputs
        while (outputList.hasChildNodes()) {
            outputList.removeChild(outputList.lastChild);
        }
        outputString.textContent = "";

        // append to outputs
        for (var i = 0; i < s.length; i++) {
            var li = document.createElement("li");
            li.innerHTML = s[i] + "<br />" + getUnicode(s[i]);
            outputList.appendChild(li);

            outputString.textContent += getUnicode(s[i]);
        }
    };

    var query = document.querySelector("input");
    updateCharacters(query.value);
    query.addEventListener("input", function(e) {
        updateCharacters(e.target.value);
    });

}());
