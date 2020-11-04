<template>
  <div>
    <div v-for="(test, index) in tests" :key="index">
      <a :href="test" @click.prevent="select(`${index}`)">{{test}}</a>
    </div>
  </div>
</template>

<script>
module.exports = {
  props: {
    tests: {
      type: Array,
      default: function() {return ['from prop']}
    }
  },
  data: function() {
    return {
    }
  },  // data
  methods: {
    select: function(i) {
      let test = this.tests[i];
      this.$emit('selected', test)
    }
  },  // methods
}
</script>

<style scoped>
</style>
