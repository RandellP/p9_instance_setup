# If someone wanted to use this module through classification, this would be the entry point.
# However, the user would have to manually run the setup_user plan, or upload_auth_files to make the created
# account usable. As the puppet master wouldn't have access to the users auth files.
#
# @summary Classification entry point
#
# @example
#   include p9_instance_setup
class p9_instance_setup (
  String $test_user = "tester",
  Boolean $set_zsh = true,
  ) {

  create_resources( "p9_instance_setup::core" )
  create_resources( "p9_instance_setup::user_setup", $test_user)
  if $set_zsh {
    create_resources( "p9_instance_setup::ohmyzsh", $test_user)
  }
  create_resources( "p9_instance_setup::dashboard")

}
