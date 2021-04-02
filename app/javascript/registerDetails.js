function registerDetails(details) {
  const registerButton = document.getElementById(`${details}-registration`);
  registerButton.addEventListener('click', (e) => {
    const detailsForm = document.getElementById(`${details}-form`);
    const formData = new FormData(detailsForm);
    const XHR = new XMLHttpRequest();
    const url = location.pathname;
    const pathParameter = url.split("/");
    XHR.open("POST", `/rooms/${pathParameter[2]}/${details}s`, true);
    XHR.responseType = "json";
    debugger
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      } else if (XHR.readyState === XHR.DONE && XHR.status === 200) {
        const detailsInput = document.getElementById(`${details}-input`)
        detailsInput.value = "";
      };
    };
    e.preventDefault();
  });
}

window.addEventListener('load', function() {
  registerDetails("event")
})
window.addEventListener('load', function() {
  registerDetails("distance")
})