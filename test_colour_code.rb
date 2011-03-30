require 'colour_code'
require 'test/unit'
require 'rack/test'

class TestColourCode < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_get_index
    get '/'

    assert_match %{<div id="preview"></div>}, last_response.body
  end

  def test_post_index_when_lang_is_ruby
    post '/', {:code => %{p 'name'}, :lang => 'Ruby', :css_type => 'class'}

    assert_match %{</textarea>}, last_response.body
    assert_match 'name', last_response.body
  end

  def test_post_index_when_lang_is_python
    post '/', {:code => %{print None}, :lang => 'Python', :css_type => 'class'}

    assert_match %{</textarea>}, last_response.body
    assert_match 'None', last_response.body
  end

  def test_post_index_when_output_type_is_page
    post '/', {:code => %{print None}, :css_type => 'class'}

    assert_match %{</textarea>}, last_response.body
    assert_match 'None', last_response.body
  end

  def test_post_index_when_output_type_is_inline
    post '/', {:code => %{print None}, :css_type => 'style'}

    assert_match %{</textarea>}, last_response.body
    assert_match 'None', last_response.body
  end
end
