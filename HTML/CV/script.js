document.addEventListener('DOMContentLoaded', function() {
    const sections = document.querySelectorAll('section');

    const observer = new IntersectionObserver(entries => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('show');
            } else {
                entry.target.classList.remove('show');
            }
        });
    }, {
        threshold: 0.1
    });

    sections.forEach(section => {
        observer.observe(section);
    });
    // Smooth scrolling for nav links

    const navLinks = document.querySelectorAll('nav a');
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href').substring(1);
            const targetSection = document.getElementById(targetId);
            window.scrollTo({
                top: targetSection.offsetTop - document.querySelector('header').offsetHeight,
                behavior: 'smooth'
            });
        });
    });
});



// Smooth scrolling for mouse wheel
(function() {
    var scrollTime = 0.7; // Scroll time in seconds
    var scrollDistance = 300; // Distance in pixels

    var smoothScroll = function(event) {
        event.preventDefault();

        var delta = event.wheelDelta / 120 || -event.detail / 3;
        var scrollTop = window.pageYOffset;
        var finalScroll = scrollTop - parseInt(delta * scrollDistance);

        TweenMax.to(window, scrollTime, {
            scrollTo: { y: finalScroll, autoKill: true },
            ease: Power1.easeOut,
            autoKill: true,
            overwrite: 5
        });
    };

    window.addEventListener('mousewheel', smoothScroll, { passive: false });
    window.addEventListener('DOMMouseScroll', smoothScroll, { passive: false });
})();
