 document.querySelectorAll('.menu .Lista .opciones').forEach(item => {
                item.addEventListener('mouseenter', function (e) {
                    const dropdownMenu = this.querySelector('.dropdown-menu');
                    if (dropdownMenu) {
                        dropdownMenu.style.display = 'block';
                    }
                });
                item.addEventListener('mouseleave', function (e) {
                    const dropdownMenu = this.querySelector('.dropdown-menu');
                    if (dropdownMenu) {
                        dropdownMenu.style.display = 'none';
                    }
                });
            });




