/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 document.addEventListener('DOMContentLoaded', function () {
                var carouselImage = new bootstrap.Carousel(document.getElementById('imageCarousel'), {
                    interval: 3000
                });

                var thumbnails = document.querySelectorAll('.thumbnail-indicators img');
                thumbnails.forEach(function (thumbnail) {
                    thumbnail.addEventListener('click', function () {
                        var index = parseInt(this.getAttribute('data-bs-slide-to'));
                        carouselImage.to(index);
                        thumbnails.forEach(function (thumbnail) {
                            thumbnail.classList.remove('active');
                        });
                        this.classList.add('active');
                    });
                });

                document.getElementById('imageCarousel').addEventListener('slide.bs.carousel', function (event) {
                    var index = event.to;
                    thumbnails.forEach(function (thumbnail) {
                        thumbnail.classList.remove('active');
                    });
                    thumbnails[index].classList.add('active');
                });
            });

