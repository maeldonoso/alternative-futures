var Comments;

Comments = {};

Comments.buildComment = function(comment) {
  var showRow = document.createElement('div');
  showRow.className = 'show__row';

  var showIcon = document.createElement('div');
  showIcon.className = 'show__icon';

  var showText = document.createElement('div');
  showText.className = 'show__text';

  var image = document.createElement('IMG');
  image.className = 'avatar__image';
  image.setAttribute('src', comment.avatar_path);

  var description = document.createElement('p');
  description.className = 'description__subtitle';
  description.appendChild(document.createTextNode(comment.description));

  var body = document.createElement('p');
  body.appendChild(document.createTextNode(comment.body));

  showText.appendChild(description);
  showText.appendChild(body);
  showIcon.appendChild(image);
  showRow.appendChild(showIcon);
  showRow.appendChild(showText);

  return showRow
}

Comments.addComment = function(comment) {
  var newComment, comments;

  newComment = Comments.buildComment(comment);
  comments = document.getElementById('commentList');
  comments.insertBefore(newComment, comments.firstChild)
}
