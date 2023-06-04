require "application_system_test_case"

class PrivateMessagesTest < ApplicationSystemTestCase
  setup do
    @private_message = private_messages(:one)
  end

  test "visiting the index" do
    visit private_messages_url
    assert_selector "h1", text: "Private messages"
  end

  test "should create private message" do
    visit private_messages_url
    click_on "New private message"

    fill_in "Content", with: @private_message.content
    fill_in "Recipient", with: @private_message.recipient_id
    fill_in "Sender", with: @private_message.sender_id
    click_on "Create Private message"

    assert_text "Private message was successfully created"
    click_on "Back"
  end

  test "should update Private message" do
    visit private_message_url(@private_message)
    click_on "Edit this private message", match: :first

    fill_in "Content", with: @private_message.content
    fill_in "Recipient", with: @private_message.recipient_id
    fill_in "Sender", with: @private_message.sender_id
    click_on "Update Private message"

    assert_text "Private message was successfully updated"
    click_on "Back"
  end

  test "should destroy Private message" do
    visit private_message_url(@private_message)
    click_on "Destroy this private message", match: :first

    assert_text "Private message was successfully destroyed"
  end
end
