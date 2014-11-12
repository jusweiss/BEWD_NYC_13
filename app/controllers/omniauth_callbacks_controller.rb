class OmniauthCallbacksController < Devise::OmniauthCallbacksController #got this from lesson 14 materials

  def facebook
    auth_data = request.env['omniauth.auth'] #need to create this .env file and get a facebook key
    # auth_data = request.env['omniauth.auth']
    @user = User.find_or_create_by(email: auth_data[:info][:email]) do |user|
      user.first_name = auth_data[:info][:first_name]
      user.last_name = auth_data[:info][:last_name]
      user.facebook_token = auth_data[:credentials][:token]
    end


    sign_in @user
    redirect_to root_path #redirect to the get restaurants controller or list generator controller
  end
end




#GOT THIS FROM FACEBOOK WHEN I CREATED MY APP
# The following snippet of code will give the basic version of the SDK where the options are set to their most common defaults. You should insert it directly after the opening <body> tag on each page you want to load it:
# <script>
#   window.fbAsyncInit = function() {
#     FB.init({
#       appId      : '556523447812569',
#       xfbml      : true,
#       version    : 'v2.2'
#     });
#   };

#   (function(d, s, id){
#      var js, fjs = d.getElementsByTagName(s)[0];
#      if (d.getElementById(id)) {return;}
#      js = d.createElement(s); js.id = id;
#      js.src = "//connect.facebook.net/en_US/sdk.js";
#      fjs.parentNode.insertBefore(js, fjs);
#    }(document, 'script', 'facebook-jssdk'));
# </script>

# Let's try adding a Like button, just copy and paste the line of code below anywhere inside the <body> of your page:
# <div
#   class="fb-like"
#   data-share="true"
#   data-width="450"
#   data-show-faces="true">
# </div>