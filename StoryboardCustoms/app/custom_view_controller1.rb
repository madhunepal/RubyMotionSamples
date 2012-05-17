class CustomViewController1 < UIViewController
  TAG_IDLABEL = 1
  TAG_TEXTBOX = 2

  def viewDidLoad
    puts "#{self.to_s}: CustomViewController1::viewDidLoad"
    self.title = "CustomVC1"

    @idlabel = retrieveSubviewWithTag(self, TAG_IDLABEL)
    @idlabel.text = self.to_s

    @textbox = retrieveSubviewWithTag(self, TAG_TEXTBOX)
    @textbox.delegate = self
  end

  def prepareForSegue(segue, sender:sender)
    puts "#{self.to_s}: CustomViewController1::prepareForSegue '#{segue.identifier}'"

    if segue.identifier == "Subview"
      customVC2 = segue.destinationViewController
      customVC2.setParentId(self.to_s)
      customVC2.customtext.text = @textbox.text
    end
  end

  # UITextFieldDelegate protocol (required to dismiss the keyboard)
  def textFieldShouldReturn(textfield)
    textfield.resignFirstResponder
    true
  end
end