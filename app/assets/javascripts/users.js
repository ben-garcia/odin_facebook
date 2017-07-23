var validateOptions = {
  rules: {
    user_email: {
      required: true,
      email: true
    },
    user_password: {
      required: true,
    },
    user_password_confirmation: {
      equalTo: '#user_password'
    }
  },
  messages: {
    user_email: {
      required: 'Enter an Email Address',
      email: 'Your email address must be in the format of name@domain.com'
    },
    user_password: 'Please Enter a password',
    user_password_confirmation: 'Both passwords must match'
  },
  errorPlacement: function(error, element) {
    $(error).appendTo(element.parent());
    $(error).css({
      color: "red",
      margin: "10px"
    });
  }
};

$(document).ready(function() {
    $('#new_user').validate(validateOptions);
});
