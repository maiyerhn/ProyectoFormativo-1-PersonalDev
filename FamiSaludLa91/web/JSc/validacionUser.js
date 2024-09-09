   document.addEventListener('DOMContentLoaded', function () {
    var overlay = document.querySelector('.overlay');
    var customConfirm = document.querySelector('.custom-confirm');
    var btnCancel = document.querySelector('.btn-cancel');
    var btnEdit = document.querySelector('.btn-edit');
    var btnSave = document.querySelector('.btn-save');
    var viewMode = document.querySelector('.view-mode');
    var editMode = document.querySelector('.edit-mode');
    var btncerrar = document.querySelector('.btn-cerrar');
    const form = document.getElementById('editForm');
    const passwordInput = document.getElementById('editPassword');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const phoneInput = document.getElementById('editPhone');
    const emailInput = document.getElementById('editEmail');

    function validatePhone(phone) {
        return /^\d{10}$/.test(phone);
    }

    function validatePassword(password) {
        return password.length >= 8 && password.length <= 20;
    }

    function validateEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    function validateForm() {
        const phone = phoneInput.value;
        const password = passwordInput.value;
        const confirmPassword = confirmPasswordInput.value;
        const email = emailInput.value;

        let isValid = true;
        const errorMessages = {
            phone: '',
            password: '',
            confirmPassword: '',
            email: ''
        };

        if (!validatePhone(phone)) {
            isValid = false;
            errorMessages.phone = 'El telefono debe tener exactamente 10 dígitos.';
        }

        if (!validatePassword(password)) {
            isValid = false;
            errorMessages.password = 'La contrasena debe tener entre 8 y 20 caracteres.';
        }

        if (password !== confirmPassword) {
            isValid = false;
            errorMessages.confirmPassword = 'La contrasena y la confirmación de contraseña deben coincidir.';
        }

        if (!validateEmail(email)) {
            isValid = false;
            errorMessages.email = 'El correo electrónico no es válido. Debe tener el formato correcto.';
        }

        document.getElementById('errorPhone').textContent = errorMessages.phone;
        document.getElementById('errorPassword').textContent = errorMessages.password;
        document.getElementById('errorConfirmPassword').textContent = errorMessages.confirmPassword;
        document.getElementById('errorEmail').textContent = errorMessages.email;

        phoneInput.classList.toggle('error', !!errorMessages.phone);
        passwordInput.classList.toggle('error', !!errorMessages.password);
        confirmPasswordInput.classList.toggle('error', !!errorMessages.confirmPassword);
        emailInput.classList.toggle('error', !!errorMessages.email);

        return isValid;
    }

    function toggleSaveButton() {
        if (validateForm()) {
            btnSave.disabled = false;
        } else {
            btnSave.disabled = true;
        }
    }

    // Manejo de eventos para los botones
    document.querySelector('.btn-Usuario').addEventListener('click', function () {
        overlay.style.display = 'block';
        customConfirm.style.display = 'block';
        editMode.style.display = 'none';
        btnEdit.style.display = 'block';
        editMode.classList.remove('hidden');
        viewMode.classList.remove('hidden');
    });

    btnEdit.addEventListener('click', function () {
        viewMode.classList.add('hidden');
        editMode.classList.remove('hidden');
        editMode.style.display = 'block';
        btnSave.style.display = 'block';
        btnEdit.style.display = 'none';
    });

    btnCancel.addEventListener('click', function () {
        viewMode.classList.remove('hidden');
        editMode.classList.add('hidden');
        btnSave.style.display = 'none';
        btnEdit.style.display = 'block';
        editMode.style.display = 'none';
    });

    btncerrar.addEventListener('click', function () {
        viewMode.classList.remove('hidden');
        editMode.classList.add('hidden');
        customConfirm.classList.add('hidden');
        btnSave.style.display = 'none';
        overlay.style.display = 'none';
        customConfirm.style.display = 'none';
    });

    overlay.addEventListener('click', function () {
        overlay.style.display = 'none';
        customConfirm.style.display = 'none';
    });

    phoneInput.addEventListener('input', toggleSaveButton);
    passwordInput.addEventListener('input', toggleSaveButton);
    confirmPasswordInput.addEventListener('input', toggleSaveButton);
    emailInput.addEventListener('input', toggleSaveButton);

    btnSave.addEventListener('click', function () {
        if (validateForm()) {
            form.submit();
        }
    });

    toggleSaveButton();
});
