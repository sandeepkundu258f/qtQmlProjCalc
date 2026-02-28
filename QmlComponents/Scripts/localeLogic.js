// This tells Qt this is a shared library (static-like behavior)
.pragma library

function formatDisplay(value) {
    if (value === "" || value === "-") return value;

    let locale = Qt.locale();
    let parts = value.split(/([\+\-\u00d7\u00f7])/);

    return parts.map((part, index) => {
        if (part === "" || part === undefined) return "";

        //Handle Operators
        if (["+", "\u00d7", "\u00f7"].includes(part) || (part === "-" && index > 0)) {
            return part;
        }
        if (part === "-" && index === 0) return "-";

        // Handle the number logic
        // Split the number into Integer and Decimal parts
        let subParts = part.split(".");
        let integerPart = subParts[0];
        let decimalPart = subParts.length > 1 ? subParts[1] : null;

        // Format only the integer part with commas
        let num = parseFloat(integerPart);
        if (isNaN(num)) return part;

        // Use toLocaleString only for the whole number part
        let formattedInt = num.toLocaleString(locale, 'f', 0);

        // Stitch it back together
        if (decimalPart !== null) {
            return formattedInt + "." + decimalPart;
        }
        return formattedInt;
    }).join("");
}
