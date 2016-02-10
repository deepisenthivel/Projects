require 'ftools'
DROPBOX_APP_KEY = qzskasbpco4a4qm
DROPBOX_APP_KEY_SECRET = 729qhbtwlilm2bq
class DropboxController < ApplicationController
  def index

  end

  def authorize
    dbsession = DropboxSession.new(DROPBOX_APP_KEY, DROPBOX_APP_KEY_SECRET)
#serialize and save this DropboxSession
session[:dropbox_session] = dbsession.serialize
#pass to get_authorize_url a callback url that will return the user here
redirect_to dbsession.get_authorize_url url_for(:action => 'dropbox_callback')
  end

  def upload
    return redirect_to(:action => 'authorize') unless session[:dropbox_session]
    dropbox_session = Dropbox::Session.deserialize(session[:dropbox_session])
    return redirect_to(:action => 'authorize') unless dropbox_session.authorized?

    if request.method == 'POST' then
      dropbox_session.mode = :dropbox
      File.copy("/" + params[:file].tempfile.path, '~/Dropbox/' + params[:file].original_filename)
      params[:file].tempfile.unlink
      dropbox_session.upload '~/Dropbox/' + params[:file].original_filename, 'RCase'
      render :text => 'Uploaded OK'
    else
      redirect_to(:action => 'index', :notice => 'Upload Fail')
    end
  end
end
