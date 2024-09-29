run "setup_tests" {
    module {
        source = "./tests/setup"
    }
}

run "create_bucket" {
  command = plan

  variables {
    example_var = "${run.setup_tests.example_var}-aws-s3-website-test"
    sub_resource = "${run.setup_tests.sub_resource}"
  }

  # Check that the bucket name is correct
  assert {
    condition     = null_resource.subresource[0].triggers.name == "sub"
    error_message = "Invalid bucket name"
  }

}
