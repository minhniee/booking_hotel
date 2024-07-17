const show_alert = document.querySelector("[show-alert]");

if (show_alert) {

    const timeShow = show_alert.getAttribute("data-time");
    const closeAlert = document.querySelector("[close-alert]");
    closeAlert.addEventListener("click", () => {
        show_alert.classList.add("alert-hidden");
    });


    setTimeout(() => {
        show_alert.classList.add("alert-hidden");
    }, parseInt(timeShow));
}