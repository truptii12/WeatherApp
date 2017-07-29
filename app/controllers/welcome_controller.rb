class WelcomeController < ApplicationController
  def index
  end
  
  def about
  end
  
  def blog
  end



def redirect
  client = Signet::OAuth2::Client.new({
    client_id: ENV.fetch('237805892874-tj7457sahjtu2l4de53phpn57joehe5t.apps.googleusercontent.com'),
    client_secret: ENV.fetch('vcEkHk5t3z0MItJ_EUnhwxu6'),
    authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
    scope: Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY,
    redirect_uri: url_for(:action => :callback)
  })

  redirect_to client.authorization_uri.to_s
end
  
def callback
  client = Signet::OAuth2::Client.new({
    client_id: ENV.fetch('237805892874-tj7457sahjtu2l4de53phpn57joehe5t.apps.googleusercontent.com'),
    client_secret: ENV.fetch('vcEkHk5t3z0MItJ_EUnhwxu6'),
    token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
    redirect_uri: url_for(:action => :callback),
    code: params[:code]
  })

  response = client.fetch_access_token!

  session[:access_token] = response['access_token']

  redirect_to url_for(:action => :calendars)
end
  
def calendars
  client = Signet::OAuth2::Client.new(access_token: session[:access_token])

  service = Google::Apis::CalendarV3::CalendarService.new

  service.authorization = client

  @calendar_list = service.list_calendar_lists
end

  
  
   #Next methods use the twitter API for different tasks
  def create_access_token(oauth_token, oauth_token_secret)
      consumer = OAuth::Consumer.new("RRM8PXe37Xke8ONeylYpDsQTS",
          "M2NXXJSuA62azBuL1S8uQOfdp4hDlFC7IAlfdWvARtX6CfQcVb",
          { :site => "https://api.twitter.com",
            :scheme => :header
          })
      # create the access token
      token_hash = { :oauth_token => oauth_token,
                     :oauth_token_secret => oauth_token_secret
                    }
      access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
      return access_token
  end
    
  def twittertrends
     if session[:user_id] != nil
      access_token = create_access_token("293621661-rXLGrpZT2OofQ6D1TXlFsCmDeQTruXb7Tdi6b0Hz", "L0A1O0T2iLOWclQXLSpRcTMd4W5G78ZmVZvtnI8WsjUtm")
      # use the access token to get the trends
      response = access_token.request(:get,
        "https://api.twitter.com/1.1/trends/available.json")
      info = JSON.parse(response.body)
      render json: info
     end
  end
  
  
  def customtweets
     if session[:user_id] != nil
      access_token = create_access_token("293621661-rXLGrpZT2OofQ6D1TXlFsCmDeQTruXb7Tdi6b0Hz", "L0A1O0T2iLOWclQXLSpRcTMd4W5G78ZmVZvtnI8WsjUtm")
      # use the access token to get tweets on programming
      response = access_token.request(:get,
        "https://api.twitter.com/1.1/search/tweets.json?q=programming")
      info = JSON.parse(response.body)
      render json: info
     end 
  end
  
  def morecustomtweets
     if session[:user_id] != nil
      access_token = create_access_token("293621661-rXLGrpZT2OofQ6D1TXlFsCmDeQTruXb7Tdi6b0Hz", "L0A1O0T2iLOWclQXLSpRcTMd4W5G78ZmVZvtnI8WsjUtm")
      # use the access token to get tweets on programming that have been
      # posted until 18 October 2014
      response = access_token.request(:get,
          "https://api.twitter.com/1.1/search/
          tweets.json?q=programming&until=2014-10-18")
      info = JSON.parse(response.body)
      render json: info
     end 
  end
  
  
  
  
end
