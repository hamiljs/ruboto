require 'ruboto/activity'

ruboto_import_widgets :Button, :ImageButton, :LinearLayout, :TextView

class ImageButtonAndButtonActivity
  include Ruboto::Activity
  def on_create(bundle)
    setTitle File.basename(__FILE__).chomp('_activity.rb').split('_').map{|s| "#{s[0..0].upcase}#{s[1..-1]}" }.join(' ')

    self.content_view =
      linear_layout :orientation => LinearLayout::VERTICAL do
          @text_view = text_view :text => 'What hath Matz wrought?', :id => 42
          button :text => 'Button', :width => :wrap_content, :id => 44,
                 :on_click_listener => proc {@text_view.text = 'Button pressed'}
          image_button :image_resource => $package.R::drawable::get_ruboto_core, :width => :wrap_content, :id => 43,
                       :on_click_listener => proc {@text_view.text = 'Image button pressed'}
      end
  end
end
