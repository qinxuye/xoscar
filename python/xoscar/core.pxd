# Copyright 2022-2023 XProbe Inc.
# derived from copyright 1999-2021 Alibaba Group Holding Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


cdef class ActorRef:
    cdef object __weakref__
    cdef public str address
    cdef public object uid
    cdef public list proxy_addresses
    cdef dict _methods


cdef class LocalActorRef(ActorRef):
    cdef object _actor_weakref
    cdef _weakref_local_actor(self)


cdef class BufferRef:
    cdef public str address
    cdef public bytes uid


cdef class FileObjectRef:
    cdef public str address
    cdef public bytes uid


cdef class _BaseActor:
    cdef object __weakref__
    cdef str _address
    cdef object _lock
    cdef object _uid

    cpdef ActorRef ref(self)


cdef class ActorEnvironment:
    cdef public dict actor_locks
    cdef public object address
