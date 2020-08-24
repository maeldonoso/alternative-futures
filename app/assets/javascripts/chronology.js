// First part: on the Show Future view, add/remove Futures to/from the Chronology.
// Local storage of the Futures is reordered after each add/remove action.

function Future(id, title, date, link, description) {
  this.id = id;
  this.title = title;
  this.date = date;
  this.link = link;
  this.description = description;
}

function chronologyEvents () {
  const addToChronologyButton = document.querySelector('#add-to-chronology');
  const removeFromChronologyButton = document.querySelector('#remove-from-chronology');

  const futureID = document.querySelector('#future-id').textContent;
  const futureTitle = document.querySelector('#future-title').textContent;
  let futureDate = document.querySelector('#future-date').textContent;
  const futureLink = document.querySelector('#future-link').textContent;
  if (futureDate == '') {
    futureDate = '0';
  }
  const futureDescription = document.querySelector('#future-description').textContent;

  const future = new Future(futureID, futureTitle, futureDate, futureLink, futureDescription);

  addToChronologyButton.addEventListener('click', (event) => {
    addToChronology(event, future);
    addToChronologyButton.setAttribute('class', 'btn btn--inline no-display');
    removeFromChronologyButton.setAttribute('class', 'btn btn--inline');
  }, false);

  removeFromChronologyButton.addEventListener('click', (event) => {
    removeFromChronology(event, future);
    addToChronologyButton.setAttribute('class', 'btn btn--inline');
    removeFromChronologyButton.setAttribute('class', 'btn btn--inline no-display');
  }, false);

  if (localStorage.getItem("future-id-" + futureID) != null) {
    addToChronologyButton.setAttribute('class', 'btn btn--inline no-display');
    removeFromChronologyButton.setAttribute('class', 'btn btn--inline');
  }
}

function addToChronology (event, future) {
  if (localStorage.getItem('counter') == null) {
    localStorage.setItem('counter', 0);
  }
  if (localStorage.getItem('counter') == 20) {
    alert('Your Chronology can only contain 20 Futures. | Votre Chronologie ne peut contenir que 20 Futurs.')
  } else {
    let counter = localStorage.getItem('counter')
    counter = parseInt(counter) + 1;

    localStorage.setItem('future-' + counter, future.id);
    localStorage.setItem('counter', counter);
    localStorage.setItem('future-id-' + future.id, JSON.stringify(future));

    orderChronology(decreaseCounter = false);
  }
}

function removeFromChronology (event, future) {
  let counter = parseInt(localStorage.getItem('counter'));
  let futuresArray = new Array(counter);
  for (var i = 0; i < counter; i++) {
    futuresArray[i] = localStorage.getItem('future-' + (i + 1));
  }

  localStorage.removeItem('future-' + (futuresArray.indexOf(future.id) + 1));
  localStorage.removeItem('future-id-' + future.id);

  orderChronology(decreaseCounter = true);
}

function orderChronology (decreaseCounter) {
  let counter = parseInt(localStorage.getItem('counter'));
  let futuresArray = new Array(counter);
  for (var i = 0; i < counter; i++) {
    futuresArray[i] = localStorage.getItem('future-' + (i + 1));
  }
  futuresArray.sort();
  futuresArray= futuresArray.filter(Boolean); // Suppress null values.

  if (decreaseCounter == true) {
    counter = counter - 1;
    localStorage.setItem('counter', counter);
  }
  for (var i = 0; i < counter; i++) {
    localStorage.setItem('future-' + (i + 1), futuresArray[i]);
  }
  if (decreaseCounter == true) {
    localStorage.removeItem('future-' + (counter + 1));
  }
}

// Second part: on the Chronology view, select the Chronology and display it.
// There are four different Chronologies:
// - My Chronology
// - My Futures Chronology
// - Popular Chronology
// - Recent Chronology
// The buttons allow the User to select the Chronology to display.
// Before a Chronology is loaded, we start by making sure all Chronologies
// are hidden and buttons are set up to their normal display.
// For My Chronology, the button Delete Chronology is hidden when there is
// no Future to display.

function displayChronology() {
  myChronology(1) // Display My Chronology by default.

  const myChronologyButton = document.querySelector('#my-chronology');
  myChronologyButton.addEventListener('click', (event) => {
    myChronology(event);
  }, false);

  const myFuturesChronologyButton = document.querySelector('#my-futures-chronology');
  myFuturesChronologyButton.addEventListener('click', (event) => {
    myFuturesChronology(event);
  }, false);

  const popularChronologyButton = document.querySelector('#popular-chronology');
  popularChronologyButton.addEventListener('click', (event) => {
    popularChronology(event);
  }, false);

  const recentChronologyButton = document.querySelector('#recent-chronology');
  recentChronologyButton.addEventListener('click', (event) => {
    recentChronology(event);
  }, false);
}

function myChronology(event) {
  noDisplay()
  const chronology = document.querySelector('#chronology');
  chronology.className = '';
  const deleteChronologyButton = document.querySelector('#delete-chronology');
  deleteChronologyButton.className = 'btn btn--inline ';
  while (chronology.firstChild) {
    chronology.removeChild(chronology.firstChild); // Remove existing Futures before adding new ones.
  }

  let counter = parseInt(localStorage.getItem('counter'));
  let futuresList = [];
  for (var i = 0; i < counter; i++) {
    future_id = localStorage.getItem('future-' + (i + 1));
    future = localStorage.getItem('future-id-' + future_id);
    futuresList[i] = JSON.parse(future);
  }

  futuresList.sort((a, b) => (a.date > b.date) ? -1 : 1); // Sort the Futures by descending order.
  for (var i = 0; i < counter; i++) {
    futureRow = displayFutureInChronology(futuresList[i]);
    chronology.appendChild(futureRow);
  }

  deleteChronologyButton.addEventListener('click', (event) => {
    deleteChronology(event);
  }, false);

  const myChronologyButton = document.querySelector('#my-chronology');
  myChronologyButton.className = 'btn btn--inline btn--active';

  checkEmptyChronology(counter);
}

function myFuturesChronology(event) {
  noDisplay()
  const myFutures = document.querySelector('#my-futures');
  myFutures.className = '';

  const myFuturesChronologyButton = document.querySelector('#my-futures-chronology');
  myFuturesChronologyButton.className = 'btn btn--inline btn--active';
}

function popularChronology(event) {
  noDisplay()
  const popularFutures = document.querySelector('#popular-futures');
  popularFutures.className = '';

  const popularChronologyButton = document.querySelector('#popular-chronology');
  popularChronologyButton.className = 'btn btn--inline btn--active';
}

function recentChronology(event) {
  noDisplay()
  const recentFutures = document.querySelector('#recent-futures');
  recentFutures.className = '';

  const recentChronologyButton = document.querySelector('#recent-chronology');
  recentChronologyButton.className = 'btn btn--inline btn--active';
}

function noDisplay() {
  // Hide all Chronologies.
  const myChronology = document.querySelector('#chronology');
  myChronology.className = 'no-display';
  const myFutures = document.querySelector('#my-futures');
  myFutures.className = 'no-display';
  const popularFutures = document.querySelector('#popular-futures');
  popularFutures.className = 'no-display';
  const recentFutures = document.querySelector('#recent-futures');
  recentFutures.className = 'no-display';

  // Hide the Delete Chronology button and the Empty Chronology message.
  const deleteChronologyButton = document.querySelector('#delete-chronology');
  deleteChronologyButton.className = 'btn btn--inline no-display';
  const emptyChronologyMessage = document.querySelector('#empty-chronology');
  emptyChronologyMessage.className = 'empty-chronology no-display';

  // Set up all buttons to their normal display.
  const myChronologyButton = document.querySelector('#my-chronology');
  myChronologyButton.className = 'btn btn--inline';
  const myFuturesChronologyButton = document.querySelector('#my-futures-chronology');
  myFuturesChronologyButton.className = 'btn btn--inline';
  const popularChronologyButton = document.querySelector('#popular-chronology');
  popularChronologyButton.className = 'btn btn--inline';
  const recentChronologyButton = document.querySelector('#recent-chronology');
  recentChronologyButton.className = 'btn btn--inline';
}

function displayFutureInChronology(future) {
  const futureRow = document.createElement('div');
  futureRow.className = 'show__row';

  const showText = document.createElement('div');
  showText.className = 'chronology__text';

  const futureLink = document.createElement('a');
  futureLink.className = 'chronology__link';
  futureLink.href = future.link;

  const showTitle = document.createElement('h4');
  showTitle.appendChild(document.createTextNode(future.title));

  const showDate = document.createElement('p');
  if (future.date == 0) {
    showDate.appendChild(document.createTextNode('?'));
  } else {
    showDate.appendChild(document.createTextNode(future.date));
  }
  showDate.className = 'description__subtitle';

  const showDescription = document.createElement('p');
  showDescription.appendChild(document.createTextNode(future.description));

  futureLink.appendChild(showTitle);
  showText.appendChild(showDate);
  showText.appendChild(futureLink);
  showText.appendChild(showDescription);
  futureRow.appendChild(showText);

  return futureRow
}

function deleteChronology () {
  let counter = parseInt(localStorage.getItem('counter'));
  for (var i = 0; i < counter; i++) {
    future_id = localStorage.getItem('future-' + (i + 1));
    localStorage.removeItem('future-id-' + future_id);
    localStorage.removeItem('future-' + (i + 1));
  }
  localStorage.removeItem('counter');

  const chronology = document.querySelector('#chronology');
  while (chronology.firstChild) {
    chronology.removeChild(chronology.firstChild);
  }

  checkEmptyChronology(0);
}

function checkEmptyChronology(counter) {
  if (counter == 0 || isNaN(counter)) {
    const deleteChronologyButton = document.querySelector('#delete-chronology');
    deleteChronologyButton.className = 'btn btn--inline no-display';
    const emptyChronologyMessage = document.querySelector('#empty-chronology');
    emptyChronologyMessage.className = 'empty-chronology';
  }
}
