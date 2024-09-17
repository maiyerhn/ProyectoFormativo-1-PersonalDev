document.getElementById('btnCancelar').addEventListener('click', function () {
    window.location.href = '/FamiSaludLa91/Vistas/Referencia.jsp';
});

document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");
    const campos = form.querySelectorAll("input[type='text'], input[type='password']");
    const telefono = document.getElementById("telefono");
    const acceptTerms = document.getElementById("acceptTerms");

    telefono.addEventListener("keypress", function (event) {
        const keyCode = event.keyCode || event.which;
        const keyValue = String.fromCharCode(keyCode);

        if (!/^\d+$/.test(keyValue)) {
            event.preventDefault();
        }
    });

    campos.forEach(campo => {
        campo.addEventListener("input", function () {
            validateField(this);
        });
    });

    form.addEventListener("submit", function (event) {
        let allValid = true;

        campos.forEach(campo => {
            if (!validateField(campo)) {
                allValid = false;
            }
        });

        if (!acceptTerms.checked) {
            allValid = false;
            document.getElementById("acceptTerms-error").textContent = "Debes aceptar los Términos y Condiciones para poder registrarte.";
            acceptTerms.focus();
        } else {
            document.getElementById("acceptTerms-error").textContent = "";
        }

        if (!allValid) {
            event.preventDefault();
            alert("Por favor, completa correctamente todos los campos antes de enviar el formulario.");
        }
    });

    function validateField(campo) {
        let isValid = true;
        let errorMessage = "";

        if (campo.id === "nombre" || campo.id === "apellido") {
            if (campo.value.trim().length <= 3) {
                errorMessage = "El nombre y el apellido deben tener más de 3 caracteres.";
                isValid = false;
            }
        } else if (campo.id === "telefono") {
            if (campo.value.trim().length !== 10 || isNaN(campo.value)) {
                errorMessage = "El teléfono debe tener exactamente 10 dígitos.";
                isValid = false;
            }
        } else if (campo.id === "direccion") {
            if (campo.value.trim().length < 5) {
                errorMessage = "La dirección debe tener al menos 5 caracteres.";
                isValid = false;
            }
        } else if (campo.id === "user") {
            const emailPattern = /^[^\s@]+@gmail\.com$/;
            if (!emailPattern.test(campo.value)) {
                errorMessage = "El correo electrónico debe ser una dirección válida de @gmail.com.";
                isValid = false;
            }
        } else if (campo.id === "password") {
            const passwordPattern = /^(?=.*[A-Z])(?=.*\d).{8,}$/;
            if (!passwordPattern.test(campo.value)) {
                errorMessage = "La contraseña debe tener al menos 8 caracteres, incluir una mayúscula y un número.";
                isValid = false;
            }
        } else if (campo.id === "password1") {
            const password = document.getElementById("password").value;
            if (campo.value !== password) {
                errorMessage = "Las contraseñas no coinciden.";
                isValid = false;
            }
        }

        if (!isValid) {
            campo.style.borderColor = "red";
            document.getElementById(campo.id + "-error").textContent = errorMessage;
        } else {
            campo.style.borderColor = "";
            document.getElementById(campo.id + "-error").textContent = "";
        }

        return isValid;
    }
});