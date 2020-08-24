function twinklingSphere () {
  var sphere = document.querySelector('#home-sphere');
  var slogan = document.querySelector('#home-slogan');

  sphere.setAttribute('class', 'sphere-large sphere--blue');
  if (window.intervalId) {
    clearInterval(intervalId); // Clear interval preventively in case the User returns to the page.
  }

  var show_alternatives = function() {
    if (sphere.getAttribute('class') == 'sphere-large' || sphere.getAttribute('class') == 'sphere-large sphere--blue' ) {
      sphere.setAttribute('class', 'sphere-large sphere--green');
    }
    else if (sphere.getAttribute('class') == 'sphere-large sphere--green') {
      sphere.setAttribute('class', 'sphere-large sphere--yellow');
    }
    else if (sphere.getAttribute('class') == 'sphere-large sphere--yellow') {
      sphere.setAttribute('class', 'sphere-large sphere--red');
    }
    else if (sphere.getAttribute('class') == 'sphere-large sphere--red') {
      sphere.setAttribute('class', 'sphere-large sphere--blue');
    }
  };

  sphere.addEventListener('mouseenter', function() {
    intervalId = setInterval(show_alternatives, 350);
  });

  sphere.addEventListener('mouseleave', function() {
    clearInterval(intervalId);
    sphere.setAttribute('class', 'sphere-large sphere--blue');
  });
}
