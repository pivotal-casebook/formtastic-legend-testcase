require 'spec_helper'

describe PostsController do
  describe "#new" do
    it "builds two comments on a post" do
      get :new
      assigns(:post).comments.size.should == 2
    end

    context "with integrated views" do
      integrate_views

      it "should render a legend for both comments' fieldsets" do
        get :new
        Nokogiri::HTML(response.body).at_css("fieldset > legend > span:contains(1)").should be
        Nokogiri::HTML(response.body).at_css("fieldset > legend > span:contains(2)").should be
      end
    end
  end
end
