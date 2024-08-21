/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function saveScrollPosition() {
    localStorage.setItem('scrollPosition', window.scrollY);
}


function restoreScrollPosition() {
    const scrollPosition = localStorage.getItem('scrollPosition');
    if (scrollPosition !== null) {
        window.scrollTo(0, parseInt(scrollPosition, 10));
        localStorage.removeItem('scrollPosition');
    }
}


window.addEventListener('load', restoreScrollPosition);


document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.add-to-cart').forEach(link => {
        link.addEventListener('click', (event) => {
            event.preventDefault();
            const href = event.currentTarget.getAttribute('href');

            saveScrollPosition();

            Swal.fire({
                icon: 'success',
                title: 'Exito',
                text: 'Producto agregado al carrito.',
                confirmButtonText: 'Aceptar'
            }).then(() => {
                setTimeout(() => {
                    window.location.href = href;
                }, 1500);
            });
        });
    });
});