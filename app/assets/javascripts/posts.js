// validator options for when commenting on a post.
var commentValidators = {
  rules: {
    comment_content: {
      required: true
    }
  },
  messages: {
    comment_content: {
      required: "Enter A Comment"
    }
  },
  errorPlacement: function(error, element) {
    $(error).appendTo(element.parent());
    $(error).css({
      color: "red",
      margin: "10px"
    });
  }
};

// validator options for when validating a new post.
var newPostValidators = {
  rules: {
    post_title: {
      required: true
    },
    post_content: {
      required: true
    }
  },
  messages: {
    post_title: {
      required: "*Dont Forget a Title"
    },
    post_content: {
      required: "*Dont Forget the Content"
    }
  },
  errorPlacement: function(error, element) {
    $(error).insertAfter($(element));
    $(error).css({
      color: "red",
      margin: "10px"
    });
  }
};

$(document).ready(function() {
  $(".comments").hide();
  commentsInteraction();

  $(".new_comment").each(function() {
    $(this).validate(commentValidators);
  });

  $(".new_post").validate(newPostValidators);
});

// Display the comments section
var commentsInteraction = function() {
  $(".view-comments").each(function() {
    $(this).click(function() {
      $($(this).next()).show();
    });
  });
};
