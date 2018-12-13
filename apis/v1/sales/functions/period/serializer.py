from functools import reduce

class Serializer:
    
    def profile_serializer(self, val, sales):
        def total_sales():
            total = 0
            amount = list(map(lambda val: float(val.amount), sales))
            if len(amount) > 0:
                total = reduce(lambda a, b: a + b, amount)
            return total
        def downline():
            if val.group is None:
                return None
            return val.group.members.count()
        return {
            'pk': val.pk,
            'name': val.name,
            'designation': val.designation.name,
            'profile_image': val.profile_image,
            'amount': total_sales(),
            'downline': downline()
        }