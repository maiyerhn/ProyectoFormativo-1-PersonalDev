/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

        
        const imagenPorDefecto = '/FamiSaludLa91/imagenes/imagenCarrito.avif';
        
       
        document.querySelectorAll('.table img').forEach(img => {
            img.addEventListener('mouseover', function() {
                document.getElementById('imagenGrandeImg').src = this.src;
                document.getElementById('imagenGrande').style.display = 'block';
            });

            img.addEventListener('mouseout', function() {
                document.getElementById('imagenGrandeImg').src = imagenPorDefecto;
            });
        });

      
        document.querySelectorAll('.table img').forEach(img => {
            img.addEventListener('mouseleave', function() {
                document.getElementById('imagenGrandeImg').src = imagenPorDefecto;
                document.getElementById('imagenGrande').style.display = 'block';
            });
        });