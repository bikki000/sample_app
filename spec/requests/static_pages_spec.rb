require 'spec_helper'

describe "Static pages" do

	subject{page}

  describe "Home page" do

  	before {visit root_path}

  	it{should have_content("Sample App")}
  	it{should have_title(full_title(''))}
  	it{should_not have_title(full_title('HOME'))}
  end

  describe "Help Page" do

  	before {visit help_path}
  	it {should have_title(full_title("HELP"))}
  	it {should have_content("HELP")}
  end

  describe "About Page" do

  	before {visit about_path}

  	it {should have_title(full_title("ABOUT"))}
  	it {should have_content("ABOUT")}
  end

  describe "Conact Page" do

  	before {visit contact_path}

  	it {should have_title(full_title("CONTACT"))}
  	it {should have_content("CONTACT")}
  end


end