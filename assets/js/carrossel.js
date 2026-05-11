document.addEventListener('DOMContentLoaded', function () {

    const items = document.querySelectorAll('.carousel-item');
    const next = document.querySelector('.next');
    const prev = document.querySelector('.prev');

    let index = 0;
    const total = items.length;

    function showItem(i) {
        items.forEach(item => item.classList.remove('active'));
        items[i].classList.add('active');
    }

    next.addEventListener('click', function () {
        index = (index + 1) % total;
        showItem(index);
    });

    prev.addEventListener('click', function () {
        index = (index - 1 + total) % total;
        showItem(index);
    });

    /* AUTOPLAY */
    setInterval(() => {
        index = (index + 1) % total;
        showItem(index);
    }, 3500);

});
