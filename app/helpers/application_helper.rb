module ApplicationHelper
  #
  # Returns page page_title if available, default otherwise
  #
  def page_title
    (@content_for_title if @content_for_title).to_s
  end

  #
  # Returns page meta_keywords if available, default otherwise
  #
  def meta_keywords
    if @content_for_meta_keywords
      keywords = @content_for_meta_keywords.to_s
    else
      keywords = 'worship database, worship log, service log, church archive, worship archive, liturgy, litergical, paster\'s notebook, preacher\'s archive, church administrator archive, search sermon, find sermons'
    end
  end

  #
  # Returns page meta_description if available, default otherwise
  #
  def meta_description
    if @content_for_meta_description
      description = @content_for_meta_description.to_s
    else
      description = 'Worship Log provides a complete, searchable, and secure archive of worship services. We are bringing the preacher\'s notebook into the new millennium.'
    end
  end

  #
  # Returns asterisk is field is required
  #
  def mark_required(object, attribute)  
    '<span class="required">*</span>'.html_safe if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator  
  end

  #
  # Converts unix linebreaks with html line breaks
  #
  def line_break(text)
    text.gsub("\n", '<br/>').html_safe
  end
end
