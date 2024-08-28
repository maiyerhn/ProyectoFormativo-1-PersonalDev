/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

 document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("#agregarusuario form");
    
    if (!form) {
        console.error("No se encontró el formulario en el modal.");
        return;
    }
    
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

    form.addEventListener("input", function (event) {
        if (event.target.matches("input[type='text'], input[type='password']")) {
            validateField(event.target);
        }
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
            alert("Debes aceptar los Términos y Condiciones para poder registrarte.");
            acceptTerms.focus();
        }

        if (!allValid) {
            event.preventDefault();
            alert("Por favor, completa correctamente todos los campos antes de enviar el formulario.");
        }
    });

    function validateField(campo) {
        let isValid = true;

        if (campo.id === "nombre" || campo.id === "apellido") {
            if (campo.value.trim().length <= 3) {
                isValid = false;
            }
        } else if (campo.id === "telefono") {
            
            if (campo.value.length !== 10) {
                isValid = false;
            }
        } else if (campo.id === "direccion") {
            if (campo.value.trim().length < 5) {
                isValid = false;
            }
        } else if (campo.id === "user") {
            const emailPattern = /^[^\s@]+@gmail\.com$/;
            if (!emailPattern.test(campo.value)) {
                isValid = false;
            }
        } else if (campo.id === "password") {
            const passwordPattern = /^(?=.*[A-Z])(?=.*\d).{8,}$/;
            if (!passwordPattern.test(campo.value)) {
                isValid = false;
            }
        } else if (campo.id === "password1") {
            const password = document.getElementById("password").value;
            if (campo.value !== password) {
                isValid = false;
            }
        }

        if (!isValid) {
            campo.style.borderColor = "red";
        } else {
            campo.style.borderColor = "";
        }

        return isValid;
    }
});

