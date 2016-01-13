guard :minitest do
  # with Minitest::Unit
  watch(%r{^test/(.*)\/?test_(.*)\.rb$})
  watch(%r{^lib/(.*/)?([^/]+)\.rb$})     { "test" }
  watch(%r{^test/test_helper\.rb$})      { "test" }
end
