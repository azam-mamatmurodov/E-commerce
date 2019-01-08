from rest_framework.permissions import BasePermission


class DenyListAllowCreate(BasePermission):
    def has_permission(self, request, view):
        if request.method == 'GET':
            return False
        if request.method == 'POST':
            return True
        return True
